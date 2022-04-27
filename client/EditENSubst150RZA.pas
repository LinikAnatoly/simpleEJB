unit EditENSubst150RZA;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150RZAController ;

type
  TfrmENSubst150RZAEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150RZA: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblRZAType: TLabel;
    edtRZAType: TEdit;
    spbRZAType: TSpeedButton;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbRZATypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150RZAEdit: TfrmENSubst150RZAEdit;
  ENSubst150RZAObj: ENSubst150RZA;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController, ENConsts,
  ENElementTypeController, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150RZAEdit.FormShow(Sender: TObject);
var
subst150RZA: ENSubst150RZAShort;
TempENSubst150RZA: ENSubst150RZAControllerSoapPort;
TempTKMaterials : TKMaterialsControllerSoapPort;
material : TKMaterials;
begin
  DisableControls([edtCode, edtRZAType , edtMaterialsName ]);

  if DialogState = dsView then
  begin

    DisableControls([
{      edtENElementElementName
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
    edtCode.Text := IntToStr(ENSubst150RZAObj.code);
    edtName.Text := ENSubst150RZAObj.name; 
    edtFactoryNumber.Text := ENSubst150RZAObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150RZAObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150RZAObj.commentGen);

    TempENSubst150RZA := HTTPRIOENSubst150RZA as ENSubst150RZAControllerSoapPort;
    subst150RZA := TempENSubst150RZA.getShortObject(ENSubst150RZAObj.code);
    edtRZAType.Text := subst150RZA.typeRefName;

    if ENSubst150RZAObj.materialRef <> nil then
      if ENSubst150RZAObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150RZAObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

    // edtENElementElementName.Text := ENSubst150RZAObj.element.name;
  end;
end;



procedure TfrmENSubst150RZAEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150RZA: ENSubst150RZAControllerSoapPort;
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
    TempENSubst150RZA := HTTPRIOENSubst150RZA as ENSubst150RZAControllerSoapPort;

    ENSubst150RZAObj.name := edtName.Text; 
    ENSubst150RZAObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150RZAObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150RZAObj.commentGen := edtCommentGen.Text; 
    

    if DialogState = dsInsert then
    begin
      ENSubst150RZAObj.code := Low(Integer);
      TempENSubst150RZA.add(ENSubst150RZAObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150RZA.save(ENSubst150RZAObj);
    end;
  end;
end;


procedure TfrmENSubst150RZAEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150RZAObj.element = nil then ENSubst150RZAObj.element := ENElement.Create();
               ENSubst150RZAObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150RZAEdit.spbRZATypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_RZA_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150RZAObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150RZAObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtRZAType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150RZAEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150RZAObj.materialRef = nil then
            ENSubst150RZAObj.materialRef := TKMaterialsRef.Create;
          ENSubst150RZAObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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
