
unit EditENNormVolumeAVZItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENNormVolumeAVZItemController,
    ShowTKMaterials, TKMaterialsController;

type
    TfrmENNormVolumeAVZItemEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;

    HTTPRIOENNormVolumeAVZItem: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtMaterialName: TEdit;
    Label1: TLabel;
    spbMaterialName: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;
    lblCountRequired: TLabel;
    edtCountRequired: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMaterialNameClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENNormVolumeAVZItemEdit: TfrmENNormVolumeAVZItemEdit;
  ENNormVolumeAVZItemObj: ENNormVolumeAVZItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENNormVolumeAVZItemController  ;
}
{$R *.dfm}



procedure TfrmENNormVolumeAVZItemEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
begin
  SetFloatStyle([edtCountGen, edtCountRequired]);
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
    DisableControls([spbMaterialName]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtCountGen, edtMaterialName, edtCountRequired]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if (DialogState = dsEdit) then
      DisableControls([edtMaterialName, spbMaterialName]);

    edtCode.Text := IntToStr(ENNormVolumeAVZItemObj.code);

    if ENNormVolumeAVZItemObj.materialRef <> nil then
      if ENNormVolumeAVZItemObj.materialRef.code <> low(Integer) then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        edtMaterialName.Text := TempTKMaterials.getObject(ENNormVolumeAVZItemObj.materialRef.code).name;
      end;

    if ( ENNormVolumeAVZItemObj.countGen <> nil ) then
       edtCountGen.Text := ENNormVolumeAVZItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';

    if ( ENNormVolumeAVZItemObj.countRequired <> nil ) then
       edtCountRequired.Text := ENNormVolumeAVZItemObj.countRequired.decimalString
    else
       edtCountRequired.Text := '';
  end;
end;


procedure TfrmENNormVolumeAVZItemEdit.spbMaterialNameClick(Sender: TObject);
var
  matherialShow : TfrmTKMaterialsShow;
  mtFilter : TKMaterialsFilter;
begin
  inherited;
  matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
      begin
        try
          if ENNormVolumeAVZItemObj.materialRef = nil then ENNormVolumeAVZItemObj.materialRef := TKMaterialsRef.Create;
          ENNormVolumeAVZItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    matherialShow.Free;
  end;
end;


procedure TfrmENNormVolumeAVZItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtMaterialName, edtCountGen, edtCountRequired]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;

    if (ENNormVolumeAVZItemObj.countGen = nil ) then
      ENNormVolumeAVZItemObj.countGen := TXSDecimal.Create;
    if edtCountGen.Text <> '' then
      ENNormVolumeAVZItemObj.countGen.decimalString := edtCountGen.Text
    else
      ENNormVolumeAVZItemObj.countGen := nil;

    if (ENNormVolumeAVZItemObj.countRequired = nil ) then
      ENNormVolumeAVZItemObj.countRequired := TXSDecimal.Create;
    if edtCountRequired.Text <> '' then
      ENNormVolumeAVZItemObj.countRequired.decimalString := edtCountRequired.Text
    else
      ENNormVolumeAVZItemObj.countRequired := nil;

    if DialogState = dsInsert then
    begin
      ENNormVolumeAVZItemObj.code:=low(Integer);
      TempENNormVolumeAVZItem.add(ENNormVolumeAVZItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENNormVolumeAVZItem.save(ENNormVolumeAVZItemObj);
    end;
  end;
end;


end.