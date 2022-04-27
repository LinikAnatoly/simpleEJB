unit EditAddUnitedGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient, RQOrgController, ImgList, TB2Item, TB2Dock, TB2Toolbar,
  ActnList;

type
  TfrmAddUnitedGroupEdit = class(TDialogForm)
    lblDescription: TLabel;
    edtDescription: TEdit;
    lblCostLines: TLabel;
    edtCostLines: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    isSubstation : Boolean;
  end;

var
  frmAddUnitedGroupEdit : TfrmAddUnitedGroupEdit;

implementation

uses ChildFormUnit, XSBuiltIns, ENConsts, DMReportsUnit;

{$R *.dfm}

procedure TfrmAddUnitedGroupEdit.FormShow(Sender: TObject);
begin
  DenyBlankValues([edtDescription, edtCostLines]);
  SetFloatStyle([edtCostLines]);
end;


procedure TfrmAddUnitedGroupEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

    if (isSubstation) and (not NoBlankValues([edtDescription])) then
    begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end else

    if (not isSubstation) and (not NoBlankValues([edtDescription, edtCostLines])) then
    begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;
    
end;

end.
