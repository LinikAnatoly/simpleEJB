
unit EditENSubst150Separator;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150SeparatorController;

type
    TfrmENSubst150SeparatorEdit = class(TDialogForm)

    HTTPRIOENSubst150Separator: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblName: TLabel;
    lblFactoryNumber: TLabel;
    lblCurrentNominal: TLabel;
    edtName: TEdit;
    edtFactoryNumber: TEdit;
    edtCurrentNominal: TEdit;
    lblCommentGen: TLabel;
    lblMaterialsName: TLabel;
    lblSeparatorType: TLabel;
    spbTkMaterials: TSpeedButton;
    spbSeparatorType: TSpeedButton;
    edtCommentGen: TMemo;
    edtMaterialsName: TEdit;
    edtSeparatorType: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbSeparatorTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150SeparatorEdit: TfrmENSubst150SeparatorEdit;
  ENSubst150SeparatorObj: ENSubst150Separator;

implementation

uses
  TKMaterialsController, ENConsts
  , ShowTKMaterials
  , ENHighVoltHardwareTypeController
  , ShowENHighVoltHardwareType
  , ENElementTypeController
;


{$R *.dfm}


procedure TfrmENSubst150SeparatorEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
  subst150Separator: ENSubst150SeparatorShort;
begin
  DisableControls([edtCode, edtSeparatorType, edtMaterialsName]);
  SetFloatStyle([edtCurrentNominal]);

  if DialogState = dsView then
  begin
    DisableControls([spbTkMaterials, spbSeparatorType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtSeparatorType]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
    subst150Separator := TempENSubst150Separator.getShortObject(ENSubst150SeparatorObj.code);

    edtCode.Text := IntToStr(ENSubst150SeparatorObj.code);
    edtName.Text := ENSubst150SeparatorObj.name;
    edtFactoryNumber.Text := ENSubst150SeparatorObj.factoryNumber;

    if ( ENSubst150SeparatorObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150SeparatorObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150SeparatorObj.commentGen);
    edtSeparatorType.Text := subst150Separator.typeRefName;

    if ENSubst150SeparatorObj.materialRef <> nil then
      if ENSubst150SeparatorObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150SeparatorObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150SeparatorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtSeparatorType])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;

    ENSubst150SeparatorObj.name := edtName.Text;
    ENSubst150SeparatorObj.factoryNumber := edtFactoryNumber.Text;

    if (ENSubst150SeparatorObj.currentNominal = nil ) then
      ENSubst150SeparatorObj.currentNominal := TXSDecimal.Create;
    if edtCurrentNominal.Text <> '' then
      ENSubst150SeparatorObj.currentNominal.decimalString := edtCurrentNominal.Text
    else
      ENSubst150SeparatorObj.currentNominal := nil;

    ENSubst150SeparatorObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150SeparatorObj.code:=low(Integer);
      TempENSubst150Separator.add(ENSubst150SeparatorObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Separator.save(ENSubst150SeparatorObj);
    end;
  end;
end;


procedure TfrmENSubst150SeparatorEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_SEPARATOR_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150SeparatorObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150SeparatorObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtSeparatorType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


procedure TfrmENSubst150SeparatorEdit.spbTkMaterialsClick(Sender: TObject);
var
  frmSpr_matherialShow : TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //»сключено объ€вление не используемых переменных
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
      begin
        try
          if ENSubst150SeparatorObj.materialRef = nil then
            ENSubst150SeparatorObj.materialRef := TKMaterialsRef.Create;
          ENSubst150SeparatorObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
