unit EditENServFromSideStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENServFromSideStatusController ;

type
  TfrmENServFromSideStatusEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


    HTTPRIOENServFromSideStatus: THTTPRIO;

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
  frmENServFromSideStatusEdit: TfrmENServFromSideStatusEdit;
  ENServFromSideStatusObj: ENServFromSideStatus;

implementation



{$R *.dfm}

procedure TfrmENServFromSideStatusEdit.FormShow(Sender: TObject);
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
    edtCode.Text := IntToStr(ENServFromSideStatusObj.code);
    edtName.Text := ENServFromSideStatusObj.name; 

  end;
end;



procedure TfrmENServFromSideStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
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
    TempENServFromSideStatus := HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;

    ENServFromSideStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENServFromSideStatusObj.code := Low(Integer);
      TempENServFromSideStatus.add(ENServFromSideStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServFromSideStatus.save(ENServFromSideStatusObj);
    end;
  end;
end;


end.