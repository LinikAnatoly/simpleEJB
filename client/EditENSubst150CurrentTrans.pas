
unit EditENSubst150CurrentTrans;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150CurrentTransController;

type
    TfrmENSubst150CurrentTransEdit = class(TDialogForm)
  
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

    HTTPRIOENSubst150CurrentTrans: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblTransType: TLabel;
    edtMaterialsName: TEdit;
    edtTransType: TEdit;
    spbTkMaterials: TSpeedButton;
    spbTransType: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENElementElementClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbTransTypeClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150CurrentTransEdit: TfrmENSubst150CurrentTransEdit;
  ENSubst150CurrentTransObj: ENSubst150CurrentTrans;

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


procedure TfrmENSubst150CurrentTransEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
  subst150CurrentTransShort: ENSubst150CurrentTransShort;
begin

  DisableControls([edtCode, edtTransType, edtMaterialsName]);
  SetFloatStyle([edtCurrentNominal]);

  if DialogState = dsView then
  begin
    DisableControls([edtENElementElementName, spbENElementElement,
       edtCode, spbTkMaterials, spbTransType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtTransType]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
    subst150CurrentTransShort := TempENSubst150CurrentTrans.getShortObject(ENSubst150CurrentTransObj.code);

    edtCode.Text := IntToStr(ENSubst150CurrentTransObj.code);
    edtName.Text := ENSubst150CurrentTransObj.name;
    edtFactoryNumber.Text := ENSubst150CurrentTransObj.factoryNumber;

    if (ENSubst150CurrentTransObj.currentNominal <> nil) then
       edtCurrentNominal.Text := ENSubst150CurrentTransObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150CurrentTransObj.commentGen);

    if (ENSubst150CurrentTransObj.materialRef.code <> Low(Integer)) then
    begin
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      material := TempTKMaterials.getObject(ENSubst150CurrentTransObj.materialRef.code);
      edtMaterialsName.Text := material.name;
    end;

    edtTransType.Text := subst150CurrentTransShort.typeRefName;

  end;
end;



procedure TfrmENSubst150CurrentTransEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtTransType])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
     TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;

     ENSubst150CurrentTransObj.name := edtName.Text;
     ENSubst150CurrentTransObj.factoryNumber := edtFactoryNumber.Text; 

     if (ENSubst150CurrentTransObj.currentNominal = nil ) then
       ENSubst150CurrentTransObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150CurrentTransObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150CurrentTransObj.currentNominal := nil;

     ENSubst150CurrentTransObj.commentGen := edtCommentGen.Text; 


    if DialogState = dsInsert then
    begin
      ENSubst150CurrentTransObj.code:=low(Integer);
      TempENSubst150CurrentTrans.add(ENSubst150CurrentTransObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150CurrentTrans.save(ENSubst150CurrentTransObj);
    end;
  end;
end;


procedure TfrmENSubst150CurrentTransEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150CurrentTransObj.element = nil then ENSubst150CurrentTransObj.element := ENElement.Create();
               ENSubst150CurrentTransObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENSubst150CurrentTransEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150CurrentTransObj.materialRef = nil then
            ENSubst150CurrentTransObj.materialRef := TKMaterialsRef.Create;
          ENSubst150CurrentTransObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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


procedure TfrmENSubst150CurrentTransEdit.spbTransTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_CURRENTTRANS_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150CurrentTransObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150CurrentTransObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType, 0));
        edtTransType.Text := GetReturnValue(sgENHighVoltHardwareType, 1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


end.