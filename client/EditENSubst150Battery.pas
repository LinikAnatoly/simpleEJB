
unit EditENSubst150Battery;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150BatteryController ;

type
    TfrmENSubst150BatteryEdit = class(TDialogForm)
    lblVoltage : TLabel;
    edtVoltage: TEdit;
    lblCapacity : TLabel;
    edtCapacity: TEdit;


    HTTPRIOENSubst150Battery: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblCommentGen: TLabel;
    spbENSubst150BatteryType: TSpeedButton;
    lblENSubst150BatteryType: TLabel;
    lblName: TLabel;
    lblFactoryNumber: TLabel;
    edtCommentGen: TMemo;
    edtENSubst150BatteryType: TEdit;
    edtName: TEdit;
    edtFactoryNumber: TEdit;
    spbENSubst150BatteryChargerType: TSpeedButton;
    lblENSubst150BatteryChargerType: TLabel;
    edtENSubst150BatteryChargerType: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    lblMaterialsName: TLabel;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENSubst150BatteryTypeClick(Sender: TObject);
    procedure spbENSubst150BatteryChargerTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150BatteryEdit: TfrmENSubst150BatteryEdit;
  ENSubst150BatteryObj: ENSubst150Battery;


implementation


uses ENConsts, ShowTKMaterials
  , TKMaterialsController
  , ShowENHighVoltHardwareType
  , ENHighVoltHardwareTypeController
  , ENElementTypeController
;


{$R *.dfm}


procedure TfrmENSubst150BatteryEdit.FormShow(Sender: TObject);
var
  TempTKMaterials: TKMaterialsControllerSoapPort;
  material: TKMaterials;
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
  subst150BatteryShort: ENSubst150BatteryShort;
begin
  DisableControls([edtCode, edtENSubst150BatteryType, edtENSubst150BatteryChargerType, edtMaterialsName]);
  SetFloatStyle([edtVoltage, edtCapacity]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      spbENSubst150BatteryType,
      spbENSubst150BatteryChargerType,
      spbTkMaterials
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      {edtName, }edtENSubst150BatteryType, edtENSubst150BatteryChargerType
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
    subst150BatteryShort := TempENSubst150Battery.getShortObject(ENSubst150BatteryObj.code);

    edtCode.Text := IntToStr(ENSubst150BatteryObj.code);
    edtName.Text := ENSubst150BatteryObj.name;
    edtFactoryNumber.Text := ENSubst150BatteryObj.factoryNumber; 
    if ( ENSubst150BatteryObj.voltage <> nil ) then
       edtVoltage.Text := ENSubst150BatteryObj.voltage.decimalString
    else
       edtVoltage.Text := ''; 
    if ( ENSubst150BatteryObj.capacity <> nil ) then
       edtCapacity.Text := ENSubst150BatteryObj.capacity.decimalString
    else
       edtCapacity.Text := ''; 
    MakeMultiline(edtCommentGen.Lines, ENSubst150BatteryObj.commentGen);


    edtENSubst150BatteryType.Text := subst150BatteryShort.typeRefName;
    edtENSubst150BatteryChargerType.Text := subst150BatteryShort.chargerTypeRefName;


    if ENSubst150BatteryObj.materialRef <> nil then
      if ENSubst150BatteryObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150BatteryObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150BatteryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      {edtName, }edtENSubst150BatteryType, edtENSubst150BatteryChargerType
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;

    ENSubst150BatteryObj.name := edtName.Text;
    ENSubst150BatteryObj.factoryNumber := edtFactoryNumber.Text;

     if (ENSubst150BatteryObj.voltage = nil ) then
       ENSubst150BatteryObj.voltage := TXSDecimal.Create;
     if edtVoltage.Text <> '' then
       ENSubst150BatteryObj.voltage.decimalString := edtVoltage.Text 
     else
       ENSubst150BatteryObj.voltage := nil;

     if (ENSubst150BatteryObj.capacity = nil ) then
       ENSubst150BatteryObj.capacity := TXSDecimal.Create;
     if edtCapacity.Text <> '' then
       ENSubst150BatteryObj.capacity.decimalString := edtCapacity.Text 
     else
       ENSubst150BatteryObj.capacity := nil;

     ENSubst150BatteryObj.commentGen := edtCommentGen.Text;

     
    if DialogState = dsInsert then
    begin
      ENSubst150BatteryObj.code:=low(Integer);
      TempENSubst150Battery.add(ENSubst150BatteryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Battery.save(ENSubst150BatteryObj);
    end;
  end;
end;


procedure TfrmENSubst150BatteryEdit.spbENSubst150BatteryTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_BATTERY_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150BatteryObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150BatteryObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtENSubst150BatteryType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


procedure TfrmENSubst150BatteryEdit.spbENSubst150BatteryChargerTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_BATTERY_CHARGER_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150BatteryObj.chargerTypeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150BatteryObj.chargerTypeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtENSubst150BatteryChargerType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


procedure TfrmENSubst150BatteryEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150BatteryObj.materialRef = nil then
            ENSubst150BatteryObj.materialRef := TKMaterialsRef.Create;
          ENSubst150BatteryObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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
