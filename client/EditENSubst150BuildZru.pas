unit EditENSubst150BuildZru;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150BuildZruController ;

type
  TfrmENSubst150BuildZruEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150BuildZru: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblBUILDZRUType: TLabel;
    edtBUILDZRUType: TEdit;
    spbSeparatorType: TSpeedButton;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
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
  frmENSubst150BuildZruEdit: TfrmENSubst150BuildZruEdit;
  ENSubst150BuildZruObj: ENSubst150BuildZru;

implementation

uses
  ShowENElement
  ,ENElementController
, ENHighVoltHardwareTypeController, ShowENHighVoltHardwareType,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150BuildZruEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150BuildZru: ENSubst150BuildZruControllerSoapPort;
  subst150BuildZru: ENSubst150BuildZruShort;
begin
  DisableControls([edtCode , edtBUILDZRUType , edtMaterialsName ]);

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
    TempENSubst150BuildZru := HTTPRIOENSubst150BuildZru as ENSubst150BuildZruControllerSoapPort;
    subst150BuildZru := TempENSubst150BuildZru.getShortObject(ENSubst150BuildZruObj.code);

    edtCode.Text := IntToStr(ENSubst150BuildZruObj.code);
    edtName.Text := ENSubst150BuildZruObj.name;
    edtFactoryNumber.Text := ENSubst150BuildZruObj.factoryNumber;

    if ( ENSubst150BuildZruObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150BuildZruObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150BuildZruObj.commentGen);
    edtBuildZruType.Text := subst150BuildZru.typeRefName;

    if ENSubst150BuildZruObj.materialRef <> nil then
      if ENSubst150BuildZruObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150BuildZruObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

    edtCode.Text := IntToStr(ENSubst150BuildZruObj.code);
    edtName.Text := ENSubst150BuildZruObj.name; 
    edtFactoryNumber.Text := ENSubst150BuildZruObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150BuildZruObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150BuildZruObj.commentGen);

  end;
end;



procedure TfrmENSubst150BuildZruEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150BuildZru: ENSubst150BuildZruControllerSoapPort;
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
    TempENSubst150BuildZru := HTTPRIOENSubst150BuildZru as ENSubst150BuildZruControllerSoapPort;

    ENSubst150BuildZruObj.name := edtName.Text; 
    ENSubst150BuildZruObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150BuildZruObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150BuildZruObj.commentGen := edtCommentGen.Text; 


    if DialogState = dsInsert then
    begin
      ENSubst150BuildZruObj.code := Low(Integer);
      TempENSubst150BuildZru.add(ENSubst150BuildZruObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150BuildZru.save(ENSubst150BuildZruObj);
    end;
  end;
end;


procedure TfrmENSubst150BuildZruEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150BuildZruObj.element = nil then ENSubst150BuildZruObj.element := ENElement.Create();
               ENSubst150BuildZruObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150BuildZruEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_BUILDZRU_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150BUILDZRUObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150BUILDZRUObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtBUILDZRUType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150BuildZruEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150BUILDZRUObj.materialRef = nil then
             ENSubst150BUILDZRUObj.materialRef := TKMaterialsRef.Create;
             ENSubst150BUILDZRUObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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