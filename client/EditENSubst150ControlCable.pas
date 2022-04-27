unit EditENSubst150ControlCable;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150ControlCableController ;

type
  TfrmENSubst150ControlCableEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150ControlCable: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblSeparatorType: TLabel;
    spbTkMaterials: TSpeedButton;
    spbSeparatorType: TSpeedButton;
    edtMaterialsName: TEdit;
    edtControlCableType: TEdit;
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
  frmENSubst150ControlCableEdit: TfrmENSubst150ControlCableEdit;
  ENSubst150ControlCableObj: ENSubst150ControlCable;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150ControlCableEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150ControlCable: ENSubst150ControlCableControllerSoapPort;
  subst150ControlCable: ENSubst150ControlCableShort;
begin
  DisableControls([edtCode , edtControlCableType , edtMaterialsName ]);

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
    TempENSubst150ControlCable := HTTPRIOENSubst150ControlCable as ENSubst150ControlCableControllerSoapPort;
    subst150ControlCable := TempENSubst150ControlCable.getShortObject(ENSubst150ControlCableObj.code);

    edtCode.Text := IntToStr(ENSubst150ControlCableObj.code);
    edtName.Text := ENSubst150ControlCableObj.name; 
    edtFactoryNumber.Text := ENSubst150ControlCableObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150ControlCableObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150ControlCableObj.commentGen);

    edtControlCableType.Text := subst150ControlCable.typeRefName;

    if ENSubst150ControlCableObj.materialRef <> nil then
      if ENSubst150ControlCableObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150ControlCableObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

    // edtENElementElementName.Text := ENSubst150ControlCableObj.element.name;
  end;
end;



procedure TfrmENSubst150ControlCableEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150ControlCable: ENSubst150ControlCableControllerSoapPort;
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
    TempENSubst150ControlCable := HTTPRIOENSubst150ControlCable as ENSubst150ControlCableControllerSoapPort;

    ENSubst150ControlCableObj.name := edtName.Text; 
    ENSubst150ControlCableObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150ControlCableObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150ControlCableObj.commentGen := edtCommentGen.Text; 
    

    if DialogState = dsInsert then
    begin
      ENSubst150ControlCableObj.code := Low(Integer);
      TempENSubst150ControlCable.add(ENSubst150ControlCableObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150ControlCable.save(ENSubst150ControlCableObj);
    end;
  end;
end;


procedure TfrmENSubst150ControlCableEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150ControlCableObj.element = nil then ENSubst150ControlCableObj.element := ENElement.Create();
               ENSubst150ControlCableObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150ControlCableEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_CONTROL_CABLE_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150ControlCableObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150ControlCableObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtControlCableType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150ControlCableEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150ControlCableObj.materialRef = nil then
            ENSubst150ControlCableObj.materialRef := TKMaterialsRef.Create;
          ENSubst150ControlCableObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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