
unit EditENSubst150OwnTrans;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150OwnTransController;

type
    TfrmENSubst150OwnTransEdit = class(TDialogForm)
    lblPower : TLabel;
    edtPower: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    HTTPRIOENSubst150OwnTrans: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    spbENSubst150OwnTransType: TSpeedButton;
    lblENSubst150OwnTransType: TLabel;
    edtENSubst150OwnTransType: TEdit;
    lblENVoltageClass: TLabel;
    edtENVoltageClass: TEdit;
    spbENVoltageClass: TSpeedButton;
    HTTPRIOENVoltageClass: THTTPRIO;
    lblName: TLabel;
    lblFactoryNumber: TLabel;
    edtName: TEdit;
    edtFactoryNumber: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    lblMaterialsName: TLabel;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENSubst150OwnTransTypeClick(Sender: TObject);
    procedure spbENVoltageClassClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150OwnTransEdit: TfrmENSubst150OwnTransEdit;
  ENSubst150OwnTransObj: ENSubst150OwnTrans;

implementation

uses
  ShowENElement
  , ENElementController
  , ShowENVoltageClass
  , ENVoltageClassController
  , ENConsts
  , ShowTKMaterials
  , TKMaterialsController
  , ShowENHighVoltHardwareType
  , ENHighVoltHardwareTypeController
  , ENElementTypeController
;


{$R *.dfm}


procedure TfrmENSubst150OwnTransEdit.FormShow(Sender: TObject);
var
  TempENVoltageClass: ENVoltageClassControllerSoapPort;
  TempTKMaterials : TKMaterialsControllerSoapPort;
  voltageClassObj: ENVoltageClass;
  material : TKMaterials;
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  subst150OwnTransShort: ENSubst150OwnTransShort;
begin
  DisableControls([edtCode, edtENSubst150OwnTransType, edtENVoltageClass, edtMaterialsName]);
  SetFloatStyle([edtPower]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      spbENSubst150OwnTransType,
      spbENVoltageClass,
      spbTkMaterials
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName, edtENSubst150OwnTransType, edtENVoltageClass
     ]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
    subst150OwnTransShort := TempENSubst150OwnTrans.getShortObject(ENSubst150OwnTransObj.code);

    edtCode.Text := IntToStr(ENSubst150OwnTransObj.code);
    edtName.Text := ENSubst150OwnTransObj.name;
    edtFactoryNumber.Text := ENSubst150OwnTransObj.factoryNumber;

    if ( ENSubst150OwnTransObj.power <> nil ) then
       edtPower.Text := ENSubst150OwnTransObj.power.decimalString
    else
       edtPower.Text := ''; 

    MakeMultiline(edtCommentGen.Lines, ENSubst150OwnTransObj.commentGen);

    edtENSubst150OwnTransType.Text := subst150OwnTransShort.typeRefName;

    if ENSubst150OwnTransObj.voltageClassRef <> nil then
      if ENSubst150OwnTransObj.voltageClassRef.code <> LOW_INT then
      begin
        TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
        voltageClassObj := TempENVoltageClass.getObject(ENSubst150OwnTransObj.voltageClassRef.code);
        if voltageClassObj <> nil then
        begin
          edtENVoltageClass.Text := voltageClassObj.description;
        end;
      end;

    if ENSubst150OwnTransObj.materialRef <> nil then
      if ENSubst150OwnTransObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150OwnTransObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;
      
  end;
end;



procedure TfrmENSubst150OwnTransEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName, edtENSubst150OwnTransType, edtENVoltageClass
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;

    ENSubst150OwnTransObj.name := edtName.Text;
    ENSubst150OwnTransObj.factoryNumber := edtFactoryNumber.Text;

     if (ENSubst150OwnTransObj.power = nil ) then
       ENSubst150OwnTransObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       ENSubst150OwnTransObj.power.decimalString := edtPower.Text 
     else
       ENSubst150OwnTransObj.power := nil;

     ENSubst150OwnTransObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150OwnTransObj.code:=low(Integer);
      TempENSubst150OwnTrans.add(ENSubst150OwnTransObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150OwnTrans.save(ENSubst150OwnTransObj);
    end;
  end;
end;


procedure TfrmENSubst150OwnTransEdit.spbENSubst150OwnTransTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_OWNTRANS_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150OwnTransObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150OwnTransObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtENSubst150OwnTransType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150OwnTransEdit.spbENVoltageClassClick(
  Sender: TObject);
var
   frmENVoltageClassShow: TfrmENVoltageClassShow;
begin
   frmENVoltageClassShow := TfrmENVoltageClassShow.Create(Application, fmNormal);
   try
      with frmENVoltageClassShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150OwnTransObj.voltageClassRef = nil then ENSubst150OwnTransObj.voltageClassRef := ENVoltageClassRef.Create;
               ENSubst150OwnTransObj.voltageClassRef.code := StrToInt(GetReturnValue(sgENVoltageClass,0));
               edtENVoltageClass.Text:=GetReturnValue(sgENVoltageClass,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENVoltageClassShow.Free;
   end;
end;

procedure TfrmENSubst150OwnTransEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150OwnTransObj.materialRef = nil then
            ENSubst150OwnTransObj.materialRef := TKMaterialsRef.Create;
          ENSubst150OwnTransObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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