unit EditENSubst150DGK;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150DGKController ;

type
  TfrmENSubst150DGKEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150DGK: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblSeparatorType: TLabel;
    spbTkMaterials: TSpeedButton;
    spbSeparatorType: TSpeedButton;
    edtMaterialsName: TEdit;
    edtDGKType: TEdit;
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
  frmENSubst150DGKEdit: TfrmENSubst150DGKEdit;
  ENSubst150DGKObj: ENSubst150DGK;

implementation

uses
  ShowENElement
  ,ENElementController
, ENConsts, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150DGKEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150DGK: ENSubst150DGKControllerSoapPort;
  subst150DGK: ENSubst150DGKShort;
begin
  DisableControls([edtCode , edtDGKType , edtMaterialsName ]);

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
    TempENSubst150DGK := HTTPRIOENSubst150DGK as ENSubst150DGKControllerSoapPort;
    subst150DGK := TempENSubst150DGK.getShortObject(ENSubst150DGKObj.code);

    edtCode.Text := IntToStr(ENSubst150DGKObj.code);
    edtName.Text := ENSubst150DGKObj.name; 
    edtFactoryNumber.Text := ENSubst150DGKObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150DGKObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150DGKObj.commentGen);

    edtDGKType.Text := subst150DGK.typeRefName;

    if ENSubst150DGKObj.materialRef <> nil then
      if ENSubst150DGKObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150DGKObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

    //edtENElementElementName.Text := ENSubst150DGKObj.element.name;
  end;
end;



procedure TfrmENSubst150DGKEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150DGK: ENSubst150DGKControllerSoapPort;
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
    TempENSubst150DGK := HTTPRIOENSubst150DGK as ENSubst150DGKControllerSoapPort;

    ENSubst150DGKObj.name := edtName.Text; 
    ENSubst150DGKObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150DGKObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150DGKObj.commentGen := edtCommentGen.Text; 
    
    if DialogState = dsInsert then
    begin
      ENSubst150DGKObj.code := Low(Integer);
      TempENSubst150DGK.add(ENSubst150DGKObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150DGK.save(ENSubst150DGKObj);
    end;
  end;
end;


procedure TfrmENSubst150DGKEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150DGKObj.element = nil then ENSubst150DGKObj.element := ENElement.Create();
               ENSubst150DGKObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150DGKEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_DGK_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150DGKObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150DGKObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtDGKType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150DGKEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150DGKObj.materialRef = nil then
             ENSubst150DGKObj.materialRef := TKMaterialsRef.Create;
             ENSubst150DGKObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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