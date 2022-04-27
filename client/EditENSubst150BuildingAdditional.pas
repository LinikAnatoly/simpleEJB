unit EditENSubst150BuildingAdditional;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150BuildingAdditionalController ;

type
  TfrmENSubst150BuildingAdditionalEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;
    lblCurrentNominal : TLabel;
    edtCurrentNominal: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
  

    HTTPRIOENSubst150BuildingAdditional: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtBuildingAdditionalType: TEdit;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
    spbBuildingAdditionalType: TSpeedButton;
    lblBuildingAdditionalType: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbBuildingAdditionalTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150BuildingAdditionalEdit: TfrmENSubst150BuildingAdditionalEdit;
  ENSubst150BuildingAdditionalObj: ENSubst150BuildingAdditional;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150BuildingAdditionalEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150BuildingAdditional: ENSubst150BuildingAdditionalControllerSoapPort;
  subst150BuildingAdditional: ENSubst150BuildingAdditionalShort;
begin
  DisableControls([edtCode , edtBuildingAdditionalType , edtMaterialsName ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
     
       ]);
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
    edtCode.Text := IntToStr(ENSubst150BuildingAdditionalObj.code);
    edtName.Text := ENSubst150BuildingAdditionalObj.name; 
    edtFactoryNumber.Text := ENSubst150BuildingAdditionalObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150BuildingAdditionalObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150BuildingAdditionalObj.commentGen);

    TempENSubst150BuildingAdditional := HTTPRIOENSubst150BuildingAdditional as ENSubst150BuildingAdditionalControllerSoapPort;
    subst150BuildingAdditional := TempENSubst150BuildingAdditional.getShortObject(ENSubst150BuildingAdditionalObj.code);

    edtCode.Text := IntToStr(ENSubst150BuildingAdditionalObj.code);
    edtName.Text := ENSubst150BuildingAdditionalObj.name;
    edtFactoryNumber.Text := ENSubst150BuildingAdditionalObj.factoryNumber;

    if ( ENSubst150BuildingAdditionalObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150BuildingAdditionalObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150BuildingAdditionalObj.commentGen);
    edtBuildingAdditionalType.Text := subst150BuildingAdditional.typeRefName;

    if ENSubst150BuildingAdditionalObj.materialRef <> nil then
      if ENSubst150BuildingAdditionalObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150BuildingAdditionalObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;
  end;
end;



procedure TfrmENSubst150BuildingAdditionalEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150BuildingAdditional: ENSubst150BuildingAdditionalControllerSoapPort;
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
    TempENSubst150BuildingAdditional := HTTPRIOENSubst150BuildingAdditional as ENSubst150BuildingAdditionalControllerSoapPort;

    ENSubst150BuildingAdditionalObj.name := edtName.Text; 
    ENSubst150BuildingAdditionalObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150BuildingAdditionalObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150BuildingAdditionalObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150BuildingAdditionalObj.code := Low(Integer);
      TempENSubst150BuildingAdditional.add(ENSubst150BuildingAdditionalObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150BuildingAdditional.save(ENSubst150BuildingAdditionalObj);
    end;
  end;
end;


procedure TfrmENSubst150BuildingAdditionalEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150BuildingAdditionalObj.element = nil then ENSubst150BuildingAdditionalObj.element := ENElement.Create();
               ENSubst150BuildingAdditionalObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtBuildingAdditionalType.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150BuildingAdditionalEdit.spbTkMaterialsClick(
  Sender: TObject);
var
  frmSpr_matherialShow : TfrmTKMaterialsShow;
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
          if ENSubst150BuildingAdditionalObj.materialRef = nil then
             ENSubst150BuildingAdditionalObj.materialRef := TKMaterialsRef.Create;
             ENSubst150BuildingAdditionalObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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

procedure TfrmENSubst150BuildingAdditionalEdit.spbBuildingAdditionalTypeClick(
  Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_BUILDINGADDITIONAL_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150BuildingAdditionalObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150BuildingAdditionalObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtBuildingAdditionalType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

end.