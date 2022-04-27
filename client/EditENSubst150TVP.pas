unit EditENSubst150TVP;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150TVPController ;

type
  TfrmENSubst150TVPEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150TVP: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblTVPType: TLabel;
    edtTVPType: TEdit;
    spbSeparatorType: TSpeedButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
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
  frmENSubst150TVPEdit: TfrmENSubst150TVPEdit;
  ENSubst150TVPObj: ENSubst150TVP;

implementation

uses
  ShowENElement
  ,ENElementController
, ENConsts, ShowENHighVoltHardwareType, ENHighVoltHardwareTypeController,
  ENElementTypeController, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150TVPEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  TempENSubst150TVP: ENSubst150TVPControllerSoapPort;
  subst150TVP: ENSubst150TVPShort;
begin
  DisableControls([edtCode,edtTVPType,edtMaterialsName]);

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
    TempENSubst150TVP := HTTPRIOENSubst150TVP as ENSubst150TVPControllerSoapPort;
    subst150TVP := TempENSubst150TVP.getShortObject(ENSubst150TVPObj.code);

    edtCode.Text := IntToStr(ENSubst150TVPObj.code);
    edtName.Text := ENSubst150TVPObj.name; 
    edtFactoryNumber.Text := ENSubst150TVPObj.factoryNumber;
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150TVPObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150TVPObj.commentGen);

   // edtENElementElementName.Text := ENSubst150TVPObj.element.name;
    edtTVPType.Text := subst150TVP.typeRefName;

    if ENSubst150TVPObj.materialRef <> nil then
      if ENSubst150TVPObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150TVPObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;

  end;
end;



procedure TfrmENSubst150TVPEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150TVP: ENSubst150TVPControllerSoapPort;
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
    TempENSubst150TVP := HTTPRIOENSubst150TVP as ENSubst150TVPControllerSoapPort;

    ENSubst150TVPObj.name := edtName.Text; 
    ENSubst150TVPObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150TVPObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150TVPObj.commentGen := edtCommentGen.Text; 
    {ENSubst150TVPObj.userGen := edtUserGen.Text;
    ENSubst150TVPObj.dateEdit := GetTXSDateFromTDateTimePicker(edtDateEdit);}

    if DialogState = dsInsert then
    begin
      ENSubst150TVPObj.code := Low(Integer);
      TempENSubst150TVP.add(ENSubst150TVPObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150TVP.save(ENSubst150TVPObj);
    end;
  end;
end;


procedure TfrmENSubst150TVPEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150TVPObj.element = nil then ENSubst150TVPObj.element := ENElement.Create();
               ENSubst150TVPObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150TVPEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_TVP_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150TVPObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150TVPObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtTVPType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150TVPEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENSubst150TVPObj.materialRef = nil then
            ENSubst150TVPObj.materialRef := TKMaterialsRef.Create;
          ENSubst150TVPObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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