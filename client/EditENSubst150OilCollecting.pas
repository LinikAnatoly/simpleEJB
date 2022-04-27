unit EditENSubst150OilCollecting;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150OilCollectingController ;

type
  TfrmENSubst150OilCollectingEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150OilCollecting: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblOilCollectingType: TLabel;
    edtOilCollectingType: TEdit;
    spbOilCollectingType: TSpeedButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbOilCollectingTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150OilCollectingEdit: TfrmENSubst150OilCollectingEdit;
  ENSubst150OilCollectingObj: ENSubst150OilCollecting;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150OilCollectingEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150OilCollecting: ENSubst150OilCollectingControllerSoapPort;
  subst150OilCollecting: ENSubst150OilCollectingShort;
begin
  DisableControls([edtCode , edtOilCollectingType , edtMaterialsName ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([  ]);
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
    edtCode.Text := IntToStr(ENSubst150OilCollectingObj.code);
    edtName.Text := ENSubst150OilCollectingObj.name; 
    edtFactoryNumber.Text := ENSubst150OilCollectingObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150OilCollectingObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150OilCollectingObj.commentGen);


    TempENSubst150OilCollecting := HTTPRIOENSubst150OilCollecting as ENSubst150OilCollectingControllerSoapPort;
    subst150OilCollecting := TempENSubst150OilCollecting.getShortObject(ENSubst150OilCollectingObj.code);

    edtCode.Text := IntToStr(ENSubst150OilCollectingObj.code);
    edtName.Text := ENSubst150OilCollectingObj.name;
    edtFactoryNumber.Text := ENSubst150OilCollectingObj.factoryNumber;

    if ( ENSubst150OilCollectingObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150OilCollectingObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150OilCollectingObj.commentGen);
    edtOilCollectingType.Text := subst150OilCollecting.typeRefName;

    if ENSubst150OilCollectingObj.materialRef <> nil then
      if ENSubst150OilCollectingObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150OilCollectingObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150OilCollectingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150OilCollecting: ENSubst150OilCollectingControllerSoapPort;
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
    TempENSubst150OilCollecting := HTTPRIOENSubst150OilCollecting as ENSubst150OilCollectingControllerSoapPort;

    ENSubst150OilCollectingObj.name := edtName.Text; 
    ENSubst150OilCollectingObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150OilCollectingObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150OilCollectingObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150OilCollectingObj.code := Low(Integer);
      TempENSubst150OilCollecting.add(ENSubst150OilCollectingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150OilCollecting.save(ENSubst150OilCollectingObj);
    end;
  end;
end;


procedure TfrmENSubst150OilCollectingEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150OilCollectingObj.element = nil then ENSubst150OilCollectingObj.element := ENElement.Create();
               ENSubst150OilCollectingObj.element.code := StrToInt(GetReturnValue(sgENElement,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150OilCollectingEdit.spbOilCollectingTypeClick(
  Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_OILCOLLECTING_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150OilCollectingObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150OilCollectingObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtOilCollectingType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150OilCollectingEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150OilCollectingObj.materialRef = nil then
             ENSubst150OilCollectingObj.materialRef := TKMaterialsRef.Create;
             ENSubst150OilCollectingObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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