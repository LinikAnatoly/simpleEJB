unit EditENCabelOut10;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENCabelOut10Controller ;

type
  TfrmENCabelOut10Edit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCabelLength : TLabel;
    edtCabelLength: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    HTTPRIOENCabelOut10: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
    lblType: TLabel;
    edtType: TEdit;
    spbENType: TSpeedButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    lblCabelMuftaType: TLabel;
    edtCabelMuftaType: TEdit;
    spbCabelMuftaType: TSpeedButton;
    HTTPRIOENCabelOutType10: THTTPRIO;
    HTTPRIOENCabelMuftaType: THTTPRIO;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENElementClick(Sender : TObject);
    procedure spbENTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbCabelMuftaTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var
  frmENCabelOut10Edit: TfrmENCabelOut10Edit;
  ENCabelOut10Obj: ENCabelOut10;

implementation

uses ShowENElement, ENElementController, 
  ShowENCabelOutType10, ENCabelOutType10Controller,
  ShowENCabelMuftaType, ENCabelMuftaTypeController,
  ShowTKMaterials, TKMaterialsController;

{$R *.dfm}

procedure TfrmENCabelOut10Edit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
  ENCabelOutType10Obj: ENCabelOutType10;
  TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
  ENCabelMuftaTypeObj: ENCabelMuftaType;
begin
  SetFloatStyle([edtCabelLength]);
  DisableControls([edtENElementName, edtMaterialsName]);
  if DialogState = dsView then
    DisableControls([spbENElement, spbTkMaterials]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([{edtName,} edtType, edtMaterialsName, edtCabelLength]);
  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENCabelOut10Obj.code);
      edtType.Text := '';
      if ENCabelOut10Obj.typeRef <> nil then
        if ENCabelOut10Obj.typeRef.code <> low(Integer) then
          begin
            TempENCabelOutType10 :=
              HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;
            ENCabelOutType10Obj :=
              TempENCabelOutType10.getObject(ENCabelOut10Obj.typeRef.code);
            try
              edtType.Text := ENCabelOutType10Obj.name;
            finally
              ENCabelOutType10Obj.Free;
              ENCabelOutType10Obj := nil;
            end;
          end;
      if ENCabelOut10Obj.muftaRef <> nil then
        if ENCabelOut10Obj.muftaRef.code <> low(Integer) then
          begin
            TempENCabelMuftaType :=
              HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;
            ENCabelMuftaTypeObj :=
              TempENCabelMuftaType.getObject(ENCabelOut10Obj.muftaRef.code);
            try
              edtCabelMuftaType.Text := ENCabelMuftaTypeObj.name;
            finally
              ENCabelMuftaTypeObj.Free;
              ENCabelMuftaTypeObj := nil;
            end;
          end;
      if ENCabelOut10Obj.materialRef <> nil then
        if ENCabelOut10Obj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENCabelOut10Obj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
      edtName.Text := ENCabelOut10Obj.name;
      if (ENCabelOut10Obj.cabelLength <> nil) then
         edtCabelLength.Text := ENCabelOut10Obj.cabelLength.decimalString
      else
         edtCabelLength.Text := '';
      //edtENElementName.Text := ENCabelOut10Obj.element.name;
    end;
end;



procedure TfrmENCabelOut10Edit.FormClose(
  Sender: TObject;  var Action: TCloseAction);
var TempENCabelOut10: ENCabelOut10ControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([{edtName,} edtType, edtMaterialsName, edtCabelLength,
      edtCabelMuftaType])
    then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
  else
    begin
      TempENCabelOut10 :=
        HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
      ENCabelOut10Obj.name := edtName.Text;
      if (ENCabelOut10Obj.cabelLength = nil) then
        ENCabelOut10Obj.cabelLength := TXSDecimal.Create;
      if edtCabelLength.Text <> '' then
        ENCabelOut10Obj.cabelLength.decimalString := edtCabelLength.Text
      else
        ENCabelOut10Obj.cabelLength := nil;
      if DialogState = dsInsert then
        begin
          ENCabelOut10Obj.code := low(Integer);
          TempENCabelOut10.add(ENCabelOut10Obj);
        end
      else if DialogState = dsEdit then
        TempENCabelOut10.save(ENCabelOut10Obj);
    end;
end;


procedure TfrmENCabelOut10Edit.spbENElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCabelOut10Obj.element = nil then ENCabelOut10Obj.element := ENElement.Create();
               ENCabelOut10Obj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENCabelOut10Edit.spbENTypeClick(Sender: TObject);
var frmENCabelOutType10Show: TfrmENCabelOutType10Show;
begin
  frmENCabelOutType10Show :=
    TfrmENCabelOutType10Show.Create(Application, fmNormal);
  try
    with frmENCabelOutType10Show do
      if ShowModal = mrOk then
        begin
          try
            if ENCabelOut10Obj.typeRef = nil then
              ENCabelOut10Obj.typeRef := ENCabelOutType10Ref.Create;
            ENCabelOut10Obj.typeRef.code :=
              StrToInt(GetReturnValue(sgENCabelOutType10, 0));
            edtType.Text := GetReturnValue(sgENCabelOutType10, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENCabelOutType10Show.Free;
  end;
end;

procedure TfrmENCabelOut10Edit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then
    Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        DenyGroupSelection := true;
        if ShowModal = mrOk then
        begin
          try
            if ENCabelOut10Obj.materialRef = nil then
              ENCabelOut10Obj.materialRef := TKMaterialsRef.Create;
            ENCabelOut10Obj.materialRef.code :=
              TKMaterialsShort(tvDep.Selected.Data).code;
            edtMaterialsName.Text :=
              TKMaterialsShort(tvDep.Selected.Data).name;
          except
            on EConvertError do Exit;
          end;
        end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENCabelOut10Edit.spbCabelMuftaTypeClick(Sender: TObject);
var frmENCabelMuftaTypeShow: TfrmENCabelMuftaTypeShow;
begin
  frmENCabelMuftaTypeShow :=
    TfrmENCabelMuftaTypeShow.Create(Application, fmNormal);
  try
    with frmENCabelMuftaTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENCabelOut10Obj.muftaRef = nil then
              ENCabelOut10Obj.muftaRef := ENCabelMuftaTypeRef.Create;
            ENCabelOut10Obj.muftaRef.code :=
              StrToInt(GetReturnValue(sgENCabelMuftaType, 0));
            edtCabelMuftaType.Text := GetReturnValue(sgENCabelMuftaType, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENCabelMuftaTypeShow.Free;
  end;
end;

end.