unit EditENSubst150TireSection;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150TireSectionController ;

type
  TfrmENSubst150TireSectionEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150TireSection: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblSeparatorType: TLabel;
    spbTkMaterials: TSpeedButton;
    spbSeparatorType: TSpeedButton;
    edtMaterialsName: TEdit;
    edtTireSectionType: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbSeparatorTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150TireSectionEdit: TfrmENSubst150TireSectionEdit;
  ENSubst150TireSectionObj: ENSubst150TireSection;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150TireSectionEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150TireSection: ENSubst150TireSectionControllerSoapPort;
  subst150TireSection: ENSubst150TireSectionShort;
begin
  DisableControls([edtCode , edtTireSectionType , edtMaterialsName ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      {edtENElementElementName
      ,spbENElementElement}
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

    TempENSubst150TireSection := HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;
    subst150TireSection := TempENSubst150TireSection.getShortObject(ENSubst150TireSectionObj.code);

    edtCode.Text := IntToStr(ENSubst150TireSectionObj.code);
    edtName.Text := ENSubst150TireSectionObj.name; 
    edtFactoryNumber.Text := ENSubst150TireSectionObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150TireSectionObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150TireSectionObj.commentGen);

    edtTireSectionType.Text := subst150TireSection.typeRefName;

    if ENSubst150TireSectionObj.materialRef <> nil then
      if ENSubst150TireSectionObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150TireSectionObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;
    //edtENElementElementName.Text := ENSubst150TireSectionObj.element.name;
  end;
end;



procedure TfrmENSubst150TireSectionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150TireSection: ENSubst150TireSectionControllerSoapPort;
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
    TempENSubst150TireSection := HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;

    ENSubst150TireSectionObj.name := edtName.Text; 
    ENSubst150TireSectionObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150TireSectionObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150TireSectionObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150TireSectionObj.code := Low(Integer);
      TempENSubst150TireSection.add(ENSubst150TireSectionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150TireSection.save(ENSubst150TireSectionObj);
    end;
  end;
end;


procedure TfrmENSubst150TireSectionEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150TireSectionObj.element = nil then ENSubst150TireSectionObj.element := ENElement.Create();
               ENSubst150TireSectionObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150TireSectionEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_TIRE_SECTION_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150TireSectionObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150TireSectionObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtTireSectionType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150TireSectionEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150TireSectionObj.materialRef = nil then
            ENSubst150TireSectionObj.materialRef := TKMaterialsRef.Create;
          ENSubst150TireSectionObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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