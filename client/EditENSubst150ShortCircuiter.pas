
unit EditENSubst150ShortCircuiter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150ShortCircuiterController;

type
    TfrmENSubst150ShortCircuiterEdit = class(TDialogForm)

    HTTPRIOENSubst150ShortCircuiter: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblName: TLabel;
    lblFactoryNumber: TLabel;
    edtName: TEdit;
    edtFactoryNumber: TEdit;
    lblCommentGen: TLabel;
    lblMaterialsName: TLabel;
    lblShortCircuiterType: TLabel;
    spbTkMaterials: TSpeedButton;
    spbShortCircuiterType: TSpeedButton;
    edtCommentGen: TMemo;
    edtMaterialsName: TEdit;
    edtShortCircuiterType: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbShortCircuiterTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150ShortCircuiterEdit: TfrmENSubst150ShortCircuiterEdit;
  ENSubst150ShortCircuiterObj: ENSubst150ShortCircuiter;

implementation

uses
  TKMaterialsController, ENConsts
  , ShowTKMaterials
  , ENHighVoltHardwareTypeController
  , ShowENHighVoltHardwareType
  , ENElementTypeController
;


{$R *.dfm}



procedure TfrmENSubst150ShortCircuiterEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
  subst150ShortCircuiterShort: ENSubst150ShortCircuiterShort;
begin
  DisableControls([edtCode, edtShortCircuiterType, edtMaterialsName]);

  if DialogState = dsView then
  begin
    DisableControls([spbTkMaterials, spbShortCircuiterType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtShortCircuiterType]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
    subst150ShortCircuiterShort := TempENSubst150ShortCircuiter.getShortObject(ENSubst150ShortCircuiterObj.code);

    edtCode.Text := IntToStr(ENSubst150ShortCircuiterObj.code);
    edtName.Text := ENSubst150ShortCircuiterObj.name;
    edtFactoryNumber.Text := ENSubst150ShortCircuiterObj.factoryNumber;
    MakeMultiline(edtCommentGen.Lines, ENSubst150ShortCircuiterObj.commentGen);

    edtShortCircuiterType.Text := subst150ShortCircuiterShort.typeRefName;

    if ENSubst150ShortCircuiterObj.materialRef <> nil then
      if ENSubst150ShortCircuiterObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150ShortCircuiterObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;
  end;
end;



procedure TfrmENSubst150ShortCircuiterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtShortCircuiterType])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;

    ENSubst150ShortCircuiterObj.name := edtName.Text;
    ENSubst150ShortCircuiterObj.factoryNumber := edtFactoryNumber.Text;
    ENSubst150ShortCircuiterObj.commentGen := edtCommentGen.Text;


    if DialogState = dsInsert then
    begin
      ENSubst150ShortCircuiterObj.code:=low(Integer);
      TempENSubst150ShortCircuiter.add(ENSubst150ShortCircuiterObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150ShortCircuiter.save(ENSubst150ShortCircuiterObj);
    end;
  end;
end;


procedure TfrmENSubst150ShortCircuiterEdit.spbShortCircuiterTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_CIRCUITER_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150ShortCircuiterObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150ShortCircuiterObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType, 0));
        edtShortCircuiterType.Text := GetReturnValue(sgENHighVoltHardwareType, 1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150ShortCircuiterEdit.spbTkMaterialsClick(
  Sender: TObject);
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
          if ENSubst150ShortCircuiterObj.materialRef = nil then
            ENSubst150ShortCircuiterObj.materialRef := TKMaterialsRef.Create;
          ENSubst150ShortCircuiterObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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
