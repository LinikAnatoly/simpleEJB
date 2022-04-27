unit EditENActForRecyclableMaterialsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, ENActController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmENActForRecyclableMaterialsAdd = class(TDialogForm)
    Label1: TLabel;
    edtFinMolCode: TEdit;
    spbMOLIn: TSpeedButton;
    Label2: TLabel;
    edtFinMolName: TEdit;
    lblNumberGen: TLabel;
    lblDateAct: TLabel;
    edtNumberGen: TEdit;
    edtDateAct: TDateTimePicker;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENAct: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure spbMOLInClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENActForRecyclableMaterialsAdd: TfrmENActForRecyclableMaterialsAdd;
  ENActForRecyclableMaterialsObj: ENAct;

implementation

uses FINMolController, ShowFINMol, ChildFormUnit, XSBuiltIns;

{$R *.dfm}

procedure TfrmENActForRecyclableMaterialsAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENAct: ENActControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtNumberGen, edtFinMolCode, edtFinMolName, edtDateAct]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
    else
    begin
      if Length(edtNumberGen.Text) > 10 then
      begin
        Application.MessageBox(PChar('Номер акта должен состоять не более, чем из 10 символов!' + #13#10 +
                                     'Иначе его невозможно будет провести в ФинКоллекции!'), PChar('Внимание!'), MB_ICONWARNING+MB_OK);
        edtNumberGen.SetFocus;
        Action := caNone;
        Exit;
      end;

      TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

      ENActForRecyclableMaterialsObj.numberGen := edtNumberGen.Text;

      if edtDateAct.Checked then
      begin
        if ENActForRecyclableMaterialsObj.dateAct = nil then
          ENActForRecyclableMaterialsObj.dateAct := TXSDate.Create;
        ENActForRecyclableMaterialsObj.dateAct.XSToNative(GetXSDate(edtDateAct.DateTime));
      end
      else
        ENActForRecyclableMaterialsObj.dateAct := nil;

      ENActForRecyclableMaterialsObj.commentGen := edtCommentGen.Text;

      if DialogState = dsInsert then
      begin
        ENActForRecyclableMaterialsObj.code := Low(Integer);
        TempENAct.createActForRecyclableMaterials(ENActForRecyclableMaterialsObj);
      end;
    end;
end;

procedure TfrmENActForRecyclableMaterialsAdd.FormShow(Sender: TObject);
begin
  edtDateAct.Checked := true;
  DisableControls([edtDateAct, edtFinMolCode, edtFinMolName]);
  DenyBlankValues([edtNumberGen, edtFinMolCode, edtFinMolName]);
end;

procedure TfrmENActForRecyclableMaterialsAdd.spbMOLInClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);

  try
    with frmFINMolShow do begin
      DisableActions([actEdit, actInsert, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          edtFinMolCode.Text := GetReturnValue(sgFINMol, 0);
          edtFinMolName.Text := GetReturnValue(sgFINMol, 1);
          ENActForRecyclableMaterialsObj.finMolCode := edtFinMolCode.Text;
          ENActForRecyclableMaterialsObj.finMolName := edtFinMolName.Text;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

end.
