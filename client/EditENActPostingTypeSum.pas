unit EditENActPostingTypeSum;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActPostingTypeSumController ;

type
  TfrmENActPostingTypeSumEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


    HTTPRIOENActPostingTypeSum: THTTPRIO;

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
  frmENActPostingTypeSumEdit: TfrmENActPostingTypeSumEdit;
  ENActPostingTypeSumObj: ENActPostingTypeSum;

implementation



{$R *.dfm}

procedure TfrmENActPostingTypeSumEdit.FormShow(Sender: TObject);
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
    edtCode.Text := IntToStr(ENActPostingTypeSumObj.code);
    edtName.Text := ENActPostingTypeSumObj.name; 

  end;
end;



procedure TfrmENActPostingTypeSumEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
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
    TempENActPostingTypeSum := HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;

    ENActPostingTypeSumObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENActPostingTypeSumObj.code := Low(Integer);
      TempENActPostingTypeSum.add(ENActPostingTypeSumObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActPostingTypeSum.save(ENActPostingTypeSumObj);
    end;
  end;
end;


end.