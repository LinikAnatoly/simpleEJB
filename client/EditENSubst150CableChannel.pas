unit EditENSubst150CableChannel;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150CableChannelController ;

type
  TfrmENSubst150CableChannelEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150CableChannel: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblcablechannelType: TLabel;
    edtcablechannelType: TEdit;
    spbcablechannelType: TSpeedButton;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbcablechannelTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150CableChannelEdit: TfrmENSubst150CableChannelEdit;
  ENSubst150CableChannelObj: ENSubst150CableChannel;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150CableChannelEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150CABLECHANNEL: ENSubst150CABLECHANNELControllerSoapPort;
  subst150CABLECHANNEL: ENSubst150CABLECHANNELShort;
begin
  DisableControls([edtCode , edtcablechannelType , edtMaterialsName   ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([        ]);
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
    edtCode.Text := IntToStr(ENSubst150CableChannelObj.code);
    edtName.Text := ENSubst150CableChannelObj.name; 
    edtFactoryNumber.Text := ENSubst150CableChannelObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150CableChannelObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150CableChannelObj.commentGen);


    TempENSubst150CABLECHANNEL := HTTPRIOENSubst150CABLECHANNEL as ENSubst150CABLECHANNELControllerSoapPort;
    subst150CABLECHANNEL := TempENSubst150CABLECHANNEL.getShortObject(ENSubst150CABLECHANNELObj.code);

    edtCode.Text := IntToStr(ENSubst150CABLECHANNELObj.code);
    edtName.Text := ENSubst150CABLECHANNELObj.name;
    edtFactoryNumber.Text := ENSubst150CABLECHANNELObj.factoryNumber;

    if ( ENSubst150CABLECHANNELObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150CABLECHANNELObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150CABLECHANNELObj.commentGen);
    edtCABLECHANNELType.Text := subst150CABLECHANNEL.typeRefName;

    if ENSubst150CABLECHANNELObj.materialRef <> nil then
      if ENSubst150CABLECHANNELObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150CABLECHANNELObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150CableChannelEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150CableChannel: ENSubst150CableChannelControllerSoapPort;
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
    TempENSubst150CableChannel := HTTPRIOENSubst150CableChannel as ENSubst150CableChannelControllerSoapPort;

    ENSubst150CableChannelObj.name := edtName.Text; 
    ENSubst150CableChannelObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150CableChannelObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150CableChannelObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150CableChannelObj.code := Low(Integer);
      TempENSubst150CableChannel.add(ENSubst150CableChannelObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150CableChannel.save(ENSubst150CableChannelObj);
    end;
  end;
end;


procedure TfrmENSubst150CableChannelEdit.spbcablechannelTypeClick(
  Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_CABLECHANNEL_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150CableChannelObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150CableChannelObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtCableChannelType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150CableChannelEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150CableChannelObj.element = nil then ENSubst150CableChannelObj.element := ENElement.Create();
               ENSubst150CableChannelObj.element.code := StrToInt(GetReturnValue(sgENElement,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150CableChannelEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150cablechannelObj.materialRef = nil then
             ENSubst150cablechannelObj.materialRef := TKMaterialsRef.Create;
             ENSubst150cablechannelObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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