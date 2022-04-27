
unit EditENSubst150Disconnector;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150DisconnectorController;

type
    TfrmENSubst150DisconnectorEdit = class(TDialogForm)
  
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
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

    lblENElementElementName : TLabel;
    edtENElementElementName : TEdit;
    spbENElementElement : TSpeedButton;
  

    HTTPRIOENSubst150Disconnector: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblDisconnectorType: TLabel;
    edtMaterialsName: TEdit;
    edtDisconnectorType: TEdit;
    spbTkMaterials: TSpeedButton;
    spbDisconnectorType: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENSubst150DisconnectorType: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENElementElementClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbDisconnectorTypeClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150DisconnectorEdit: TfrmENSubst150DisconnectorEdit;
  ENSubst150DisconnectorObj: ENSubst150Disconnector;

implementation

uses
  ShowENElement, ENElementController
  , TKMaterialsController
  , ShowTKMaterials
  , ENConsts
  , ShowENHighVoltHardwareType
  , ENHighVoltHardwareTypeController
  , ENElementTypeController
;


{$R *.dfm}


procedure TfrmENSubst150DisconnectorEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
  subst150DisconnectorShort: ENSubst150DisconnectorShort;
begin

  DisableControls([edtCode, edtDisconnectorType, edtMaterialsName]);
  SetFloatStyle([edtCurrentNominal]);

  if (DialogState = dsView) then
  begin
    DisableControls([edtENElementElementName, spbENElementElement,
        spbTkMaterials, spbDisconnectorType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtDisconnectorType]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
    subst150DisconnectorShort := TempENSubst150Disconnector.getShortObject(ENSubst150DisconnectorObj.code);

    edtCode.Text := IntToStr(ENSubst150DisconnectorObj.code);
    edtName.Text := ENSubst150DisconnectorObj.name; 
    edtFactoryNumber.Text := ENSubst150DisconnectorObj.factoryNumber; 

    if (ENSubst150DisconnectorObj.currentNominal <> nil) then
       edtCurrentNominal.Text := ENSubst150DisconnectorObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := ''; 

    MakeMultiline(edtCommentGen.Lines, ENSubst150DisconnectorObj.commentGen);


    if (ENSubst150DisconnectorObj.materialRef.code <> Low(Integer)) then
    begin
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      material := TempTKMaterials.getObject(ENSubst150DisconnectorObj.materialRef.code);
      edtMaterialsName.Text := material.name;
    end;

    edtDisconnectorType.Text := subst150DisconnectorShort.typeRefName;

  end;
end;



procedure TfrmENSubst150DisconnectorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtDisconnectorType])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
     TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;

     ENSubst150DisconnectorObj.name := edtName.Text;
     ENSubst150DisconnectorObj.factoryNumber := edtFactoryNumber.Text; 

     if (ENSubst150DisconnectorObj.currentNominal = nil ) then
       ENSubst150DisconnectorObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150DisconnectorObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150DisconnectorObj.currentNominal := nil;

     ENSubst150DisconnectorObj.commentGen := edtCommentGen.Text;

     
    if DialogState = dsInsert then
    begin
      ENSubst150DisconnectorObj.code:=low(Integer);
      TempENSubst150Disconnector.add(ENSubst150DisconnectorObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Disconnector.save(ENSubst150DisconnectorObj);
    end;
  end;
end;


procedure TfrmENSubst150DisconnectorEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150DisconnectorObj.element = nil then ENSubst150DisconnectorObj.element := ENElement.Create();
               ENSubst150DisconnectorObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENSubst150DisconnectorEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150DisconnectorObj.materialRef = nil then
            ENSubst150DisconnectorObj.materialRef := TKMaterialsRef.Create;
          ENSubst150DisconnectorObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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


procedure TfrmENSubst150DisconnectorEdit.spbDisconnectorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_DISCONNECTOR_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150DisconnectorObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150DisconnectorObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType, 0));
        edtDisconnectorType.Text := GetReturnValue(sgENHighVoltHardwareType, 1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


end.