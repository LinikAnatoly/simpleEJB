
unit EditENSubst150VoltTrans;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150VoltTransController;

type
    TfrmENSubst150VoltTransEdit = class(TDialogForm)

    HTTPRIOENSubst150VoltTrans: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblCommentGen: TLabel;
    spbENSubst150VoltTransType: TSpeedButton;
    lblENSubst150VoltTransType: TLabel;
    lblENVoltageClass: TLabel;
    spbENVoltageClass: TSpeedButton;
    lblName: TLabel;
    lblFactoryNumber: TLabel;
    edtCommentGen: TMemo;
    edtENSubst150VoltTransType: TEdit;
    edtENVoltageClass: TEdit;
    edtName: TEdit;
    edtFactoryNumber: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIOENVoltageClass: THTTPRIO;
    lblMaterialsName: TLabel;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENSubst150VoltTransTypeClick(Sender: TObject);
    procedure spbENVoltageClassClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150VoltTransEdit: TfrmENSubst150VoltTransEdit;
  ENSubst150VoltTransObj: ENSubst150VoltTrans;

implementation

uses ShowENVoltageClass, ENVoltageClassController
  , ENConsts
  , ShowTKMaterials
  , TKMaterialsController
  , ShowENHighVoltHardwareType
  , ENHighVoltHardwareTypeController
  , ENElementTypeController
;



{$R *.dfm}



procedure TfrmENSubst150VoltTransEdit.FormShow(Sender: TObject);
var
  TempENVoltageClass: ENVoltageClassControllerSoapPort;
  TempTKMaterials : TKMaterialsControllerSoapPort;
  voltageClassObj: ENVoltageClass;
  material: TKMaterials;
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  subst150VoltTransShort: ENSubst150VoltTransShort;
begin
  DisableControls([edtCode, edtENSubst150VoltTransType, edtENVoltageClass, edtMaterialsName]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      spbENSubst150VoltTransType,
      spbENVoltageClass,
      spbTkMaterials
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName, edtENSubst150VoltTransType, edtENVoltageClass
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
    subst150VoltTransShort := TempENSubst150VoltTrans.getShortObject(ENSubst150VoltTransObj.code);

    edtCode.Text := IntToStr(ENSubst150VoltTransObj.code);
    edtName.Text := ENSubst150VoltTransObj.name; 
    edtFactoryNumber.Text := ENSubst150VoltTransObj.factoryNumber; 
    MakeMultiline(edtCommentGen.Lines, ENSubst150VoltTransObj.commentGen);

    edtENSubst150VoltTransType.Text := subst150VoltTransShort.typeRefName;

    if ENSubst150VoltTransObj.voltageClassRef <> nil then
      if ENSubst150VoltTransObj.voltageClassRef.code <> LOW_INT then
      begin
        TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
        voltageClassObj := TempENVoltageClass.getObject(ENSubst150VoltTransObj.voltageClassRef.code);
        if voltageClassObj <> nil then
        begin
          edtENVoltageClass.Text := voltageClassObj.description;
        end;
      end;

    if ENSubst150VoltTransObj.materialRef <> nil then
      if ENSubst150VoltTransObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150VoltTransObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150VoltTransEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName, edtENSubst150VoltTransType, edtENVoltageClass
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;

    ENSubst150VoltTransObj.name := edtName.Text;
    ENSubst150VoltTransObj.factoryNumber := edtFactoryNumber.Text;
    ENSubst150VoltTransObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150VoltTransObj.code:=low(Integer);
      TempENSubst150VoltTrans.add(ENSubst150VoltTransObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150VoltTrans.save(ENSubst150VoltTransObj);
    end;
  end;
end;


procedure TfrmENSubst150VoltTransEdit.spbENSubst150VoltTransTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_VOLTTRANS_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150VoltTransObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150VoltTransObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtENSubst150VoltTransType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


procedure TfrmENSubst150VoltTransEdit.spbENVoltageClassClick(
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
               if ENSubst150VoltTransObj.voltageClassRef = nil then ENSubst150VoltTransObj.voltageClassRef := ENVoltageClassRef.Create;
               ENSubst150VoltTransObj.voltageClassRef.code := StrToInt(GetReturnValue(sgENVoltageClass,0));
               edtENVoltageClass.Text:=GetReturnValue(sgENVoltageClass,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENVoltageClassShow.Free;
   end;
end;

procedure TfrmENSubst150VoltTransEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150VoltTransObj.materialRef = nil then
            ENSubst150VoltTransObj.materialRef := TKMaterialsRef.Create;
          ENSubst150VoltTransObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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