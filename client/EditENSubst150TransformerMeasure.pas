unit EditENSubst150TransformerMeasure;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150TransformerMeasureController ;

type
  TfrmENSubst150TransformerMeasureEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150TransformerMeasure: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtTransformerMeasureType: TEdit;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblMaterialsName: TLabel;
    spbGroundingType: TSpeedButton;
    lblTransformerMeasureType: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbGroundingTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150TransformerMeasureEdit: TfrmENSubst150TransformerMeasureEdit;
  ENSubst150TransformerMeasureObj: ENSubst150TransformerMeasure;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150TransformerMeasureEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150TransformerMeasure: ENSubst150TransformerMeasureControllerSoapPort;
  subst150TransformerMeasure: ENSubst150TransformerMeasureShort;
begin
  DisableControls([edtCode , edtTransformerMeasureType  ,  edtMaterialsName ]);

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
    TempENSubst150TransformerMeasure := HTTPRIOENSubst150TransformerMeasure as ENSubst150TransformerMeasureControllerSoapPort;
    subst150TransformerMeasure := TempENSubst150TransformerMeasure.getShortObject(ENSubst150TransformerMeasureObj.code);

    edtCode.Text := IntToStr(ENSubst150TransformerMeasureObj.code);
    edtName.Text := ENSubst150TransformerMeasureObj.name;
    edtFactoryNumber.Text := ENSubst150TransformerMeasureObj.factoryNumber;

    if ( ENSubst150TransformerMeasureObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150TransformerMeasureObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150TransformerMeasureObj.commentGen);
    edtTransformerMeasureType.Text := subst150TransformerMeasure.typeRefName;

    if ENSubst150TransformerMeasureObj.materialRef <> nil then
      if ENSubst150TransformerMeasureObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150TransformerMeasureObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

    edtCode.Text := IntToStr(ENSubst150TransformerMeasureObj.code);
    edtName.Text := ENSubst150TransformerMeasureObj.name; 
    edtFactoryNumber.Text := ENSubst150TransformerMeasureObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150TransformerMeasureObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150TransformerMeasureObj.commentGen);

  end;
end;



procedure TfrmENSubst150TransformerMeasureEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150TransformerMeasure: ENSubst150TransformerMeasureControllerSoapPort;
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
    TempENSubst150TransformerMeasure := HTTPRIOENSubst150TransformerMeasure as ENSubst150TransformerMeasureControllerSoapPort;

    ENSubst150TransformerMeasureObj.name := edtName.Text; 
    ENSubst150TransformerMeasureObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150TransformerMeasureObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150TransformerMeasureObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150TransformerMeasureObj.code := Low(Integer);
      TempENSubst150TransformerMeasure.add(ENSubst150TransformerMeasureObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150TransformerMeasure.save(ENSubst150TransformerMeasureObj);
    end;
  end;
end;


procedure TfrmENSubst150TransformerMeasureEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150TransformerMeasureObj.element = nil then ENSubst150TransformerMeasureObj.element := ENElement.Create();
               ENSubst150TransformerMeasureObj.element.code := StrToInt(GetReturnValue(sgENElement,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150TransformerMeasureEdit.spbGroundingTypeClick(
  Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_TRANSFORMERMEASURE_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150TransformerMeasureObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150TransformerMeasureObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtTransformerMeasureType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150TransformerMeasureEdit.spbTkMaterialsClick(
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
          if ENSubst150TransformerMeasureObj.materialRef = nil then
             ENSubst150TransformerMeasureObj.materialRef := TKMaterialsRef.Create;
             ENSubst150TransformerMeasureObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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