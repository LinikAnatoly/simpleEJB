
unit EditENSubst150Discharger;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150DischargerController;

type
    TfrmENSubst150DischargerEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

    lblENElementElementName : TLabel;
    edtENElementElementName : TEdit;
    spbENElementElement : TSpeedButton;

    HTTPRIOENSubst150Discharger: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblDischargerType: TLabel;
    edtMaterialsName: TEdit;
    edtDischargerType: TEdit;
    spbTkMaterials: TSpeedButton;
    spbDischargerType: TSpeedButton;
    spbVoltageClass: TSpeedButton;
    edtVoltageClass: TEdit;
    lnlVoltageClass: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENVoltageClass: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENElementElementClick(Sender : TObject);
    procedure spbVoltageClassClick(Sender: TObject);
    procedure spbDischargerTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150DischargerEdit: TfrmENSubst150DischargerEdit;
  ENSubst150DischargerObj: ENSubst150Discharger;

implementation

uses
  ShowENElement, ENElementController, ShowENVoltageClass, ENVoltageClassController,
  ShowTKMaterials
  , TKMaterialsController
  , ENConsts
  , ENHighVoltHardwareTypeController
  , ShowENHighVoltHardwareType
  , ENElementTypeController
;


{$R *.dfm}



procedure TfrmENSubst150DischargerEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENVoltageClass : ENVoltageClassControllerSoapPort;
  voltageClass : ENVoltageClass;

  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  subst150DischargerShort: ENSubst150DischargerShort;
begin

  DisableControls([edtCode, edtVoltageClass, edtDischargerType, edtMaterialsName]);

  if DialogState = dsView then
  begin
    DisableControls([edtENElementElementName, spbENElementElement,
       spbTkMaterials, spbVoltageClass, spbDischargerType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtVoltageClass, edtDischargerType]);
  end;

  if (DialogState = dsInsert) then
  begin
    if (ENSubst150DischargerObj.voltageClassRef <> nil) then
      if (ENSubst150DischargerObj.voltageClassRef.code <> Low(Integer)) then
      begin
        TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
        voltageClass := TempENVoltageClass.getObject(ENSubst150DischargerObj.voltageClassRef.code);
        edtVoltageClass.Text := voltageClass.description;
      end;
  end;


  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    subst150DischargerShort := TempENSubst150Discharger.getShortObject(ENSubst150DischargerObj.code);

    edtCode.Text := IntToStr(ENSubst150DischargerObj.code);
    edtName.Text := ENSubst150DischargerObj.name;
    edtFactoryNumber.Text := ENSubst150DischargerObj.factoryNumber;
    MakeMultiline(edtCommentGen.Lines, ENSubst150DischargerObj.commentGen);

    if (ENSubst150DischargerObj.materialRef.code <> Low(Integer)) then
    begin
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      material := TempTKMaterials.getObject(ENSubst150DischargerObj.materialRef.code);
      edtMaterialsName.Text := material.name;
    end;

    if (ENSubst150DischargerObj.voltageClassRef.code <> Low(Integer)) then
    begin
      TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
      voltageClass := TempENVoltageClass.getObject(ENSubst150DischargerObj.voltageClassRef.code);
      //edtVoltageClass.Text := voltageClass.value.DecimalString;
      edtVoltageClass.Text := voltageClass.description;
    end;

    edtDischargerType.Text := subst150DischargerShort.typeRefName;

  end;
end;



procedure TfrmENSubst150DischargerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtDischargerType, edtVoltageClass])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
     TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
     ENSubst150DischargerObj.name := edtName.Text;
     ENSubst150DischargerObj.factoryNumber := edtFactoryNumber.Text;
     ENSubst150DischargerObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150DischargerObj.code:=low(Integer);
      TempENSubst150Discharger.add(ENSubst150DischargerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Discharger.save(ENSubst150DischargerObj);
    end;
  end;
end;


procedure TfrmENSubst150DischargerEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150DischargerObj.element = nil then ENSubst150DischargerObj.element := ENElement.Create();
               ENSubst150DischargerObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENSubst150DischargerEdit.spbVoltageClassClick(Sender: TObject);
var
  frmENVoltageClassShow : TfrmENVoltageClassShow;
begin
  frmENVoltageClassShow := TfrmENVoltageClassShow.Create(Application,fmNormal);
  try
    with frmENVoltageClassShow do
      if ShowModal = mrOk then
        begin
            try
              if ENSubst150DischargerObj.voltageClassRef = nil then
                ENSubst150DischargerObj.voltageClassRef := ENVoltageClassRef.Create;
              ENSubst150DischargerObj.voltageClassRef.code := StrToInt(GetReturnValue(sgENVoltageClass,0));
              edtVoltageClass.Text := GetReturnValue(sgENVoltageClass,2);
            except
              on EConvertError do Exit;
            end;
        end;
  finally
    frmENVoltageClassShow.Free;
  end;
end;


procedure TfrmENSubst150DischargerEdit.spbDischargerTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_DISCHARGER_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150DischargerObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150DischargerObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType, 0));
        edtDischargerType.Text := GetReturnValue(sgENHighVoltHardwareType, 1);
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


procedure TfrmENSubst150DischargerEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150DischargerObj.materialRef = nil then
            ENSubst150DischargerObj.materialRef := TKMaterialsRef.Create;
          ENSubst150DischargerObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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