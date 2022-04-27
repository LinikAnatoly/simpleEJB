unit EditENSubst150VRU150;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150VRUzruController ;

type
  TfrmENSubst150VRU150Edit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;


    HTTPRIOENSubst150VRU150: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edtNameDisp: TMemo;
    lblNameDisp: TLabel;
    edtName: TMemo;
    lblName: TLabel;
    edtInstallDate: TDateTimePicker;
    lblInstallDate: TLabel;
    edtCommentGen: TMemo;
    lblCommentGen: TLabel;
    TabSheet2: TTabSheet;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150VRU150Edit: TfrmENSubst150VRU150Edit;
  ENSubst150VRUzruObj: ENSubst150VRUzru;

implementation



{$R *.dfm}

procedure TfrmENSubst150VRU150Edit.FormShow(Sender: TObject);
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
      edtNameDisp
      ,edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENSubst150VRUzruObj.code);
    MakeMultiline(edtNameDisp.Lines, ENSubst150VRUzruObj.nameDisp);
    MakeMultiline(edtName.Lines, ENSubst150VRUzruObj.name);
    SetDateFieldForDateTimePicker(edtInstallDate, ENSubst150VRUzruObj.installDate);
    MakeMultiline(edtCommentGen.Lines, ENSubst150VRUzruObj.commentGen);

  end;
end;



procedure TfrmENSubst150VRU150Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150VRUzru: ENSubst150VRUzruControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNameDisp
      ,edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENSubst150VRUzru := HTTPRIOENSubst150VRU150 as ENSubst150VRUzruControllerSoapPort;

    ENSubst150VRUzruObj.nameDisp := edtNameDisp.Text;
    ENSubst150VRUzruObj.name := edtName.Text;
    ENSubst150VRUzruObj.installDate := GetTXSDateFromTDateTimePicker(edtInstallDate);
    ENSubst150VRUzruObj.commentGen := edtCommentGen.Text;
    
    if DialogState = dsInsert then
    begin
      ENSubst150VRUzruObj.code := Low(Integer);
      TempENSubst150VRUzru.add(ENSubst150VRUzruObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150VRUzru.save(ENSubst150VRUzruObj);
    end;
  end;
end;


end.