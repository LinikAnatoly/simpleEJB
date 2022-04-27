unit EditENHighVoltHardwareType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENHighVoltHardwareTypeController ;

type
    TfrmENHighVoltHardwareTypeEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblIsObsolete : TLabel;


    HTTPRIOENHighVoltHardwareType: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    cbIsObsolete: TComboBox;
    edtElementTypeName: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENHighVoltHardwareTypeEdit: TfrmENHighVoltHardwareTypeEdit;
  ENHighVoltHardwareTypeObj: ENHighVoltHardwareType;

implementation



{$R *.dfm}


procedure TfrmENHighVoltHardwareTypeEdit.FormShow(Sender: TObject);
var
  highVoltHardwareTypeShort: ENHighVoltHardwareTypeShort;
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
begin
  DisableControls([edtCode, edtElementTypeName]);

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([edtName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENHighVoltHardwareType := HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;
    highVoltHardwareTypeShort := TempENHighVoltHardwareType.getShortObject(ENHighVoltHardwareTypeObj.code);

    edtCode.Text := IntToStr(ENHighVoltHardwareTypeObj.code);
    edtName.Text := ENHighVoltHardwareTypeObj.name;
    edtElementTypeName.Text := highVoltHardwareTypeShort.elementTypeRefName;

    cbIsObsolete.ItemIndex := ENHighVoltHardwareTypeObj.isObsolete;
  end;
end;



procedure TfrmENHighVoltHardwareTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENHighVoltHardwareType := HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;

    ENHighVoltHardwareTypeObj.name := edtName.Text;
    ENHighVoltHardwareTypeObj.isObsolete := cbIsObsolete.ItemIndex;

    if DialogState = dsInsert then
    begin
      ENHighVoltHardwareTypeObj.code := Low(Integer);
      TempENHighVoltHardwareType.add(ENHighVoltHardwareTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENHighVoltHardwareType.save(ENHighVoltHardwareTypeObj);
    end;
  end;
end;


end.