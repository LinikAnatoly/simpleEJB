unit EditENSubst150Grounding;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150GroundingController ;

type
  TfrmENSubst150GroundingEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150Grounding: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblGroundingType: TLabel;
    edtGroundingType: TEdit;
    spbGroundingType: TSpeedButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
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
  frmENSubst150GroundingEdit: TfrmENSubst150GroundingEdit;
  ENSubst150GroundingObj: ENSubst150Grounding;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController,
  ENSubst150OilCollectingController;


{$R *.dfm}

procedure TfrmENSubst150GroundingEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150Grounding: ENSubst150GroundingControllerSoapPort;
  subst150Grounding: ENSubst150GroundingShort;
begin
  DisableControls([edtCode,edtGroundingType,edtMaterialsName]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
    //  edtENElementElementName
     // ,spbENElementElement
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
    TempENSubst150Grounding := HTTPRIOENSubst150Grounding as ENSubst150GroundingControllerSoapPort;
    subst150Grounding := TempENSubst150Grounding.getShortObject(ENSubst150GroundingObj.code);

    edtCode.Text := IntToStr(ENSubst150GroundingObj.code);
    edtName.Text := ENSubst150GroundingObj.name;
    edtFactoryNumber.Text := ENSubst150GroundingObj.factoryNumber;

    if ( ENSubst150GroundingObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150GroundingObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150GroundingObj.commentGen);
    edtGroundingType.Text := subst150Grounding.typeRefName;

    if ENSubst150GroundingObj.materialRef <> nil then
      if ENSubst150GroundingObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150GroundingObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;


    edtCode.Text := IntToStr(ENSubst150GroundingObj.code);
    edtName.Text := ENSubst150GroundingObj.name; 
    edtFactoryNumber.Text := ENSubst150GroundingObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150GroundingObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150GroundingObj.commentGen);


  end;
end;



procedure TfrmENSubst150GroundingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Grounding: ENSubst150GroundingControllerSoapPort;
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
    TempENSubst150Grounding := HTTPRIOENSubst150Grounding as ENSubst150GroundingControllerSoapPort;

    ENSubst150GroundingObj.name := edtName.Text; 
    ENSubst150GroundingObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150GroundingObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150GroundingObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150GroundingObj.code := Low(Integer);
      TempENSubst150Grounding.add(ENSubst150GroundingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Grounding.save(ENSubst150GroundingObj);
    end;
  end;
end;


procedure TfrmENSubst150GroundingEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150GroundingObj.element = nil then ENSubst150GroundingObj.element := ENElement.Create();
               ENSubst150GroundingObj.element.code := StrToInt(GetReturnValue(sgENElement,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150GroundingEdit.spbGroundingTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_GROUNDING_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150GroundingObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150GroundingObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtGroundingType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150GroundingEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150GroundingObj.materialRef = nil then
             ENSubst150GroundingObj.materialRef := TKMaterialsRef.Create;
             ENSubst150GroundingObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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