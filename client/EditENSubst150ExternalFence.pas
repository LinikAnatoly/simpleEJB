unit EditENSubst150ExternalFence;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150ExternalFenceController ;

type
  TfrmENSubst150ExternalFenceEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150ExternalFence: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblExternalFenceType: TLabel;
    edtExternalFenceType: TEdit;
    spbExternalFenceType: TSpeedButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbExternalFenceTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150ExternalFenceEdit: TfrmENSubst150ExternalFenceEdit;
  ENSubst150ExternalFenceObj: ENSubst150ExternalFence;

implementation

uses
  ShowENElement
  ,ENElementController
, ENHighVoltHardwareTypeController, ShowENHighVoltHardwareType,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150ExternalFenceEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150ExternalFence: ENSubst150ExternalFenceControllerSoapPort;
  subst150ExternalFence: ENSubst150ExternalFenceShort;
begin
  DisableControls([edtCode , edtExternalFenceType, edtMaterialsName  ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([  ]);
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
    TempENSubst150ExternalFence := HTTPRIOENSubst150ExternalFence as ENSubst150ExternalFenceControllerSoapPort;
    subst150ExternalFence := TempENSubst150ExternalFence.getShortObject(ENSubst150ExternalFenceObj.code);

    edtCode.Text := IntToStr(ENSubst150ExternalFenceObj.code);
    edtName.Text := ENSubst150ExternalFenceObj.name;
    edtFactoryNumber.Text := ENSubst150ExternalFenceObj.factoryNumber;

    if ( ENSubst150ExternalFenceObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150ExternalFenceObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150ExternalFenceObj.commentGen);
    edtExternalFenceType.Text := subst150ExternalFence.typeRefName;

    if ENSubst150ExternalFenceObj.materialRef <> nil then
      if ENSubst150ExternalFenceObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150ExternalFenceObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;


    edtCode.Text := IntToStr(ENSubst150ExternalFenceObj.code);
    edtName.Text := ENSubst150ExternalFenceObj.name; 
    edtFactoryNumber.Text := ENSubst150ExternalFenceObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150ExternalFenceObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150ExternalFenceObj.commentGen);

  end;
end;



procedure TfrmENSubst150ExternalFenceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150ExternalFence: ENSubst150ExternalFenceControllerSoapPort;
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
    TempENSubst150ExternalFence := HTTPRIOENSubst150ExternalFence as ENSubst150ExternalFenceControllerSoapPort;

    ENSubst150ExternalFenceObj.name := edtName.Text; 
    ENSubst150ExternalFenceObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150ExternalFenceObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150ExternalFenceObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150ExternalFenceObj.code := Low(Integer);
      TempENSubst150ExternalFence.add(ENSubst150ExternalFenceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150ExternalFence.save(ENSubst150ExternalFenceObj);
    end;
  end;
end;


procedure TfrmENSubst150ExternalFenceEdit.spbENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150ExternalFenceObj.element = nil then ENSubst150ExternalFenceObj.element := ENElement.Create();
                  ENSubst150ExternalFenceObj.element.code := StrToInt(GetReturnValue(sgENElement,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150ExternalFenceEdit.spbExternalFenceTypeClick(
  Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_EXTERNALFENC_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150ExternalFenceObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150ExternalFenceObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtExternalFenceType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150ExternalFenceEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150ExternalFenceObj.materialRef = nil then
             ENSubst150ExternalFenceObj.materialRef := TKMaterialsRef.Create;
             ENSubst150ExternalFenceObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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