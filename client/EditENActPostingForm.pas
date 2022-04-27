unit EditENActPostingForm;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActPostingFormController ;

type
  TfrmENActPostingFormEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


    HTTPRIOENActPostingForm: THTTPRIO;

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
  frmENActPostingFormEdit: TfrmENActPostingFormEdit;
  ENActPostingFormObj: ENActPostingForm;

implementation



{$R *.dfm}

procedure TfrmENActPostingFormEdit.FormShow(Sender: TObject);
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
    edtCode.Text := IntToStr(ENActPostingFormObj.code);
    edtName.Text := ENActPostingFormObj.name; 

  end;
end;



procedure TfrmENActPostingFormEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingForm: ENActPostingFormControllerSoapPort;
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
    TempENActPostingForm := HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;

    ENActPostingFormObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENActPostingFormObj.code := Low(Integer);
      TempENActPostingForm.add(ENActPostingFormObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActPostingForm.save(ENActPostingFormObj);
    end;
  end;
end;


end.