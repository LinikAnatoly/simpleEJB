unit EditENSubst150Tn;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150TnController ;

type
  TfrmENSubst150TnEdit = class(TDialogForm)
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
  

    HTTPRIOENSubst150Tn: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblSeparatorType: TLabel;
    spbSeparatorType: TSpeedButton;
    edtTNType: TEdit;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
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
  frmENSubst150TnEdit: TfrmENSubst150TnEdit;
  ENSubst150TnObj: ENSubst150Tn;

implementation

uses
  ShowENElement
  ,ENElementController
, ENHighVoltHardwareTypeController, ShowENHighVoltHardwareType,
  ENElementTypeController, ENConsts, ShowTKMaterials, TKMaterialsController;


{$R *.dfm}

procedure TfrmENSubst150TnEdit.FormShow(Sender: TObject);
var
subst150TN: ENSubst150TNShort;
TempENSubst150TN: ENSubst150TNControllerSoapPort;
TempTKMaterials : TKMaterialsControllerSoapPort;
material : TKMaterials;
begin
  DisableControls([edtCode,edtTNType,edtMaterialsName]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      //edtENElementElementName
      //,spbENElementElement
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
    TempENSubst150TN := HTTPRIOENSubst150TN as ENSubst150TNControllerSoapPort;
    subst150TN := TempENSubst150TN.getShortObject(ENSubst150TNObj.code);

    edtCode.Text := IntToStr(ENSubst150TnObj.code);
    edtName.Text := ENSubst150TnObj.name; 
    edtFactoryNumber.Text := ENSubst150TnObj.factoryNumber; 
    SetTXSDecimalForTEdit(edtCurrentNominal, ENSubst150TnObj.currentNominal);
    MakeMultiline(edtCommentGen.Lines, ENSubst150TnObj.commentGen);

    edtTNType.Text := subst150TN.typeRefName;

    if ENSubst150TNObj.materialRef <> nil then
      if ENSubst150TNObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150TNObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;
    //tezzzt edtENElementElementName.Text := ENSubst150TnObj.element.name;
  end;
end;



procedure TfrmENSubst150TnEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Tn: ENSubst150TnControllerSoapPort;
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
    TempENSubst150Tn := HTTPRIOENSubst150Tn as ENSubst150TnControllerSoapPort;

    ENSubst150TnObj.name := edtName.Text; 
    ENSubst150TnObj.factoryNumber := edtFactoryNumber.Text; 
    ENSubst150TnObj.currentNominal := GetTXSDecimalFromTEdit(edtCurrentNominal);
    ENSubst150TnObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150TnObj.code := Low(Integer);
      TempENSubst150Tn.add(ENSubst150TnObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Tn.save(ENSubst150TnObj);
    end;
  end;
end;


procedure TfrmENSubst150TnEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150TnObj.element = nil then ENSubst150TnObj.element := ENElement.Create();
                  ENSubst150TnObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
                  //edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150TnEdit.spbSeparatorTypeClick(Sender: TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := ENSUBST150_TN_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150TNObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150TNObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtTNType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;

procedure TfrmENSubst150TnEdit.spbTkMaterialsClick(Sender: TObject);
var
  frmSpr_matherialShow : TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //Исключено объявление не используемых переменных
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
          if ENSubst150TnObj.materialRef = nil then
            ENSubst150TnObj.materialRef := TKMaterialsRef.Create;
          ENSubst150TnObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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