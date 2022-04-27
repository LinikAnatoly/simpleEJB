
unit EditENSubst150Switch;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150SwitchController;

type
    TfrmENSubst150SwitchEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;
    lblCurrentNominal : TLabel;
    edtCurrentNominal: TEdit;
    lblCurrentDisconnection : TLabel;
    edtCurrentDisconnection: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

    lblENElementElementName : TLabel;
    edtENElementElementName : TEdit;
    spbENElementElement : TSpeedButton;

    HTTPRIOENSubst150Switch: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblSwytchType: TLabel;
    edtSwitchType: TEdit;
    spbSwitchType: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENElementElementClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbSwitchTypeClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150SwitchEdit: TfrmENSubst150SwitchEdit;
  ENSubst150SwitchObj: ENSubst150Switch;

implementation

uses
  ShowENElement, ENElementController
  , ShowTKMaterials
  , TKMaterialsController
  , ENConsts
  , ShowENHighVoltHardwareType
  , ENHighVoltHardwareTypeController
  , ENElementTypeController
;


{$R *.dfm}



procedure TfrmENSubst150SwitchEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
  subst150SwitchShort: ENSubst150SwitchShort;
begin

  DisableControls([edtCode, edtSwitchType, edtMaterialsName]);
  SetFloatStyle([edtCurrentNominal, edtCurrentDisconnection]);

  if DialogState = dsView then
  begin
    DisableControls([edtENElementElementName, spbENElementElement,
       spbTkMaterials, spbSwitchType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtSwitchType]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
    subst150SwitchShort := TempENSubst150Switch.getShortObject(ENSubst150SwitchObj.code);

    edtCode.Text := IntToStr(ENSubst150SwitchObj.code);
    edtName.Text := ENSubst150SwitchObj.name;
    edtFactoryNumber.Text := ENSubst150SwitchObj.factoryNumber;

    if (ENSubst150SwitchObj.currentNominal <> nil) then
       edtCurrentNominal.Text := ENSubst150SwitchObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';
    if ( ENSubst150SwitchObj.currentDisconnection <> nil ) then
       edtCurrentDisconnection.Text := ENSubst150SwitchObj.currentDisconnection.decimalString
    else
       edtCurrentDisconnection.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150SwitchObj.commentGen);

    if (ENSubst150SwitchObj.materialRef.code <> Low(Integer)) then
    begin
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      material := TempTKMaterials.getObject(ENSubst150SwitchObj.materialRef.code);
      edtMaterialsName.Text := material.name;
    end;

    edtSwitchType.Text := subst150SwitchShort.typeRefName;

  end;
end;



procedure TfrmENSubst150SwitchEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtSwitchType])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;

    ENSubst150SwitchObj.name := edtName.Text;
    ENSubst150SwitchObj.factoryNumber := edtFactoryNumber.Text;

     if (ENSubst150SwitchObj.currentNominal = nil ) then
       ENSubst150SwitchObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150SwitchObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150SwitchObj.currentNominal := nil;

     if (ENSubst150SwitchObj.currentDisconnection = nil ) then
       ENSubst150SwitchObj.currentDisconnection := TXSDecimal.Create;
     if edtCurrentDisconnection.Text <> '' then
       ENSubst150SwitchObj.currentDisconnection.decimalString := edtCurrentDisconnection.Text 
     else
       ENSubst150SwitchObj.currentDisconnection := nil;

     ENSubst150SwitchObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150SwitchObj.code:=low(Integer);
      TempENSubst150Switch.add(ENSubst150SwitchObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Switch.save(ENSubst150SwitchObj);
    end;
  end;
end;


procedure TfrmENSubst150SwitchEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150SwitchObj.element = nil then ENSubst150SwitchObj.element := ENElement.Create();
               ENSubst150SwitchObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENSubst150SwitchEdit.spbTkMaterialsClick(Sender: TObject);
var
  frmSpr_matherialShow : TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //»сключено объ€вление не используемых переменных
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
          if ENSubst150SwitchObj.materialRef = nil then
            ENSubst150SwitchObj.materialRef := TKMaterialsRef.Create;
          ENSubst150SwitchObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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


procedure TfrmENSubst150SwitchEdit.spbSwitchTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_SWITCH_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
      if ShowModal = mrOk then
      begin
        try
          ENSubst150SwitchObj.typeRef := ENHighVoltHardwareTypeRef.Create;
          ENSubst150SwitchObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType, 0));
          edtSwitchType.Text := GetReturnValue(sgENHighVoltHardwareType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


end.