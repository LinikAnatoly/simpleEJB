unit EditENConnectionCityType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConnectionCityTypeController ;

type
  TfrmENConnectionCityTypeEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


    HTTPRIOENConnectionCityType: THTTPRIO;

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
  frmENConnectionCityTypeEdit: TfrmENConnectionCityTypeEdit;
  ENConnectionCityTypeObj: ENConnectionCityType;

implementation



{$R *.dfm}

procedure TfrmENConnectionCityTypeEdit.FormShow(Sender: TObject);
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
    edtCode.Text := IntToStr(ENConnectionCityTypeObj.code);
    edtName.Text := ENConnectionCityTypeObj.name; 

  end;
end;



procedure TfrmENConnectionCityTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
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
    TempENConnectionCityType := HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;

    ENConnectionCityTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConnectionCityTypeObj.code := Low(Integer);
      TempENConnectionCityType.add(ENConnectionCityTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionCityType.save(ENConnectionCityTypeObj);
    end;
  end;
end;


end.