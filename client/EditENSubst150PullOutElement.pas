unit EditENSubst150PullOutElement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150PullOutElementController ;

type
  TfrmENSubst150PullOutElementEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150PullOutElement: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblSeparatorType: TLabel;
    spbTkMaterials: TSpeedButton;
    spbSeparatorType: TSpeedButton;
    edtMaterialsName: TEdit;
    edtPullOutElementType: TEdit;
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
  frmENSubst150PullOutElementEdit: TfrmENSubst150PullOutElementEdit;
  ENSubst150PullOutElementObj: ENSubst150PullOutElement;

implementation

uses
  ShowENElement
  ,ENElementController
, ENConsts, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150PullOutElementEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150PullOutElement: ENSubst150PullOutElementControllerSoapPort;
  subst150PullOutElement: ENSubst150PullOutElementShort;
begin
  DisableControls([edtCode , edtPullOutElementType , edtMaterialsName ]);

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
    TempENSubst150PullOutElement := HTTPRIOENSubst150PullOutElement as ENSubst150PullOutElementControllerSoapPort;
    subst150PullOutElement := TempENSubst150PullOutElement.getShortObject(ENSubst150PullOutElementObj.code);

    edtCode.Text := IntToStr(ENSubst150PullOutElementObj.code);
    edtName.Text := ENSubst150PullOutElementObj.name; 
    edtFactoryNumber.Text := ENSubst150PullOutElementObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150PullOutElementObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150PullOutElementObj.commentGen);

    edtPullOutElementType.Text := subst150PullOutElement.typeRefName;

    if ENSubst150PullOutElementObj.materialRef <> nil then
      if ENSubst150PullOutElementObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150PullOutElementObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150PullOutElementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150PullOutElement: ENSubst150PullOutElementControllerSoapPort;
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
    TempENSubst150PullOutElement := HTTPRIOENSubst150PullOutElement as ENSubst150PullOutElementControllerSoapPort;

    ENSubst150PullOutElementObj.name := edtName.Text; 
    ENSubst150PullOutElementObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150PullOutElementObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150PullOutElementObj.commentGen := edtCommentGen.Text; 
    
    if DialogState = dsInsert then
    begin
      ENSubst150PullOutElementObj.code := Low(Integer);
      TempENSubst150PullOutElement.add(ENSubst150PullOutElementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150PullOutElement.save(ENSubst150PullOutElementObj);
    end;
  end;
end;


procedure TfrmENSubst150PullOutElementEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150PullOutElementObj.element = nil then ENSubst150PullOutElementObj.element := ENElement.Create();
               ENSubst150PullOutElementObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150PullOutElementEdit.spbSeparatorTypeClick(
  Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_PULL_OUT_ELEMENT_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150PullOutElementObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150PullOutElementObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtPullOutElementType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150PullOutElementEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150PullOutElementObj.materialRef = nil then
            ENSubst150PullOutElementObj.materialRef := TKMaterialsRef.Create;
          ENSubst150PullOutElementObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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